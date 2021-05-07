
import UIKit
import SpriteKit

public class ArtViewController: UIViewController {
    
    public let scene = ArtScene()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let view = SKView()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        self.view = view
    }
}
