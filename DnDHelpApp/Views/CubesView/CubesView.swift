//
//  CubesView.swift
//  DnDHelpApp
//
//  Created by Nikita Kuznetsov on 02.12.2024.
//

import SwiftUI
import SpriteKit
import SceneKit

struct CubesView: UIViewRepresentable {
  
  let cubeScene = CubeScene()
  
  func makeUIView(context: Context) -> SCNView {
    let scnView = SCNView()
    
    scnView.scene = cubeScene.scene
    scnView.allowsCameraControl = true
    scnView.autoenablesDefaultLighting = true
    scnView.backgroundColor = .black
    let panGesture = UIPanGestureRecognizer(target: cubeScene, action: #selector(cubeScene.handlePan(_:)))
    scnView.addGestureRecognizer(panGesture)
    print("Pan gesture added: \(scnView.gestureRecognizers?.contains(panGesture) ?? false)")
    
    let tapGesture = UITapGestureRecognizer(target: cubeScene, action: #selector(cubeScene.handleTap(_:)))
    scnView.addGestureRecognizer(tapGesture)
    print("Tap gesture added: \(scnView.gestureRecognizers?.contains(tapGesture) ?? false)")
    
    
    
    return scnView
  }
  
  func updateUIView(_ uiView: SCNView, context: Context) {
  }
  
}

#Preview {
  CubesView()
    .ignoresSafeArea()
}

class CubeScene: NSObject {
  var scene: SCNScene
  var diceNode: SCNNode?
  
  override init() {
    scene = SCNScene()
    super.init()
    
    setupTable()
    setupCube()
    setupCamera()
    setupLighting()
  }
  
  private func setupTable() {
    let tableGeometry = SCNBox(width: 10, height: 1, length: 10, chamferRadius: 0)
    let tableNode = SCNNode(geometry: tableGeometry)
    
    tableNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
    tableNode.position = SCNVector3(0, -0.5, 0)
    
    tableNode.physicsBody = SCNPhysicsBody.static()
    tableNode.physicsBody?.categoryBitMask = 2
    
    scene.rootNode.addChildNode(tableNode)
  }
  
  private func setupCube() {
    let diceGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.1)
    diceNode = SCNNode(geometry: diceGeometry)
    
    diceNode?.position = SCNVector3(0, 5, 0)
    
    diceNode?.geometry?.firstMaterial?.diffuse.contents = UIColor.white
    
    diceNode?.physicsBody = SCNPhysicsBody.dynamic()
    diceNode?.physicsBody?.isAffectedByGravity = true
    diceNode?.physicsBody?.categoryBitMask = 1
    
    if let diceNode = diceNode {
      scene.rootNode.addChildNode(diceNode)
    }
    
    print("diceNode создан: \(String(describing: diceNode))")
    print("Физическое тело куба: \(String(describing: diceNode?.physicsBody))")
  }
  
  private func setupCamera() {
    let cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    cameraNode.position = SCNVector3(0, 10, 15)
    cameraNode.look(at: SCNVector3(0, 0, 0))
    scene.rootNode.addChildNode(cameraNode)
  }
  
  private func setupLighting() {
    let lightNode = SCNNode()
    lightNode.light = SCNLight()
    lightNode.light?.type = .omni
    lightNode.position = SCNVector3(0, 20, 10)
    scene.rootNode.addChildNode(lightNode)
    
    let ambientLight = SCNNode()
    ambientLight.light = SCNLight()
    ambientLight.light?.type = .ambient
    ambientLight.light?.color = UIColor.darkGray
    scene.rootNode.addChildNode(ambientLight)
  }
  
  // MARK: - Gesture Handlers
  
  @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
    print("handlePan вызван")
    guard let scnView = gesture.view as? SCNView else {
      print("Не SCNView")
      return
    }
    
    let location = gesture.location(in: scnView)
    let hitResults = scnView.hitTest(location, options: [
      SCNHitTestOption.categoryBitMask: 1
    ])
    guard let hitResult = hitResults.first, hitResult.node == diceNode else { return }
    
    if gesture.state == .changed {
      let translation = gesture.translation(in: scnView)
      diceNode?.position.x += Float(translation.x) * 0.01
      diceNode?.position.z -= Float(translation.y) * 0.01
      gesture.setTranslation(.zero, in: scnView)
    }
  }
  
  @objc func handleTap(_ gesture: UITapGestureRecognizer) {
    print("handleTap вызван")
    guard let scnView = gesture.view as? SCNView else {
      print("Не SCNView")
      return
    }
    
    let location = gesture.location(in: scnView)
    print("Тап по экрану в точке: \(location)")
    
    let hitResults = scnView.hitTest(location, options: [
      SCNHitTestOption.categoryBitMask: 1,
      SCNHitTestOption.searchMode: SCNHitTestSearchMode.all.rawValue
    ])
    print("Результаты hitTest: \(hitResults)")
    
    guard let hitResult = hitResults.first, hitResult.node == diceNode else {
      print("Куб не найден")
      return
    }
    
    print("Куб найден, бросаем!")
    let randomForce = SCNVector3(
      x: Float.random(in: -5...5),
      y: Float.random(in: 10...15),
      z: Float.random(in: -5...5)
    )
    diceNode?.physicsBody?.applyForce(randomForce, asImpulse: true)
  }
  
  @objc func handleCameraRotate(_ gesture: UIPanGestureRecognizer) {
    guard let scnView = gesture.view as? SCNView else { return }
    
    let translation = gesture.translation(in: scnView)
    let angle = Float(translation.x) * 0.01
    let cameraNode = scene.rootNode.childNode(withName: "camera", recursively: true)
    cameraNode?.eulerAngles.y += angle
    gesture.setTranslation(.zero, in: scnView)
  }
}
