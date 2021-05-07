
import UIKit
import SpriteKit

public class ArtScene: SKScene {
    var inks: [SKShapeNode] = []
    public var gotColors: [UIColor] = [#colorLiteral(red: 0.92, green: 0.20, blue: 0.14, alpha: 1.00), #colorLiteral(red: 0.98, green: 0.90, blue: 0.30, alpha: 1.00), #colorLiteral(red: 0.02, green: 0.07, blue: 0.51, alpha: 1.00)]
    public var titulo = SKLabelNode(fontNamed: "AppleColorEmoji")
    public var texto = SKLabelNode(fontNamed: "AppleColorEmoji")
    public var falta = SKLabelNode(fontNamed: "AppleColorEmoji")
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = #colorLiteral(red: 0.4550631046, green: 0.6557807326, blue: 0.9979295135, alpha: 1.0)
        
        titulo.fontSize = 35
        texto.fontSize = 30
        falta.fontSize = 20
        falta.lineBreakMode = NSLineBreakMode.byTruncatingHead
        falta.numberOfLines = 0
        
        self.addChild(titulo)
        self.addChild(texto)
        self.addChild(falta)
        
            //Criacao dos circulos
        for i in 0..<gotColors.count{
            var node: SKShapeNode = SKShapeNode(circleOfRadius: 20)
            node.lineWidth = 0
            node.fillColor = gotColors[i]
            self.addChild(node)
            inks.append(node)
        }
    }
    
    public override func didChangeSize(_ oldSize: CGSize) {
        falta.preferredMaxLayoutWidth = self.size.width - 25
        
        // Posicionamento dos textos
        titulo.position = CGPoint(x: self.size.width/2, y: self.size.height - 100)
        texto.position = CGPoint(x: self.size.width/2, y: 150)
        falta.position = CGPoint(x: self.size.width/2, y: 50)
        
        // Alteracao do tamanho dos textos de acordo com a largura da View
        titulo.fontSize = self.size.width*0.055
        texto.fontSize = self.size.width*0.05
        falta.fontSize = self.size.width*0.03
        

        
        //Medidas do circulo maior (onde os circulos estao posicionados) de acordo com tamanho da tela
        var radius: CGFloat = self.size.width*0.2
        var centerX: CGFloat = self.size.width/2
        var centerY: CGFloat = self.size.height/2
        
        //Posicionamento da tinta na tela de acordo com a sua cor -> posicionamento a partir de seno e cosseno -> 360/12 = 30 -> varia de 30 em 30 logo os pontos sao variacoes de seno e cosseno
        for i in 0..<inks.count {
            if i == 0{
                inks[i].position.x = centerX
                inks[i].position.y = centerY + radius
            } else if i == 1 {
                inks[i].position.x = centerX + ((1.732 * radius) / 2)
                inks[i].position.y = centerY - ((1 * radius) / 2)
            } else if i == 2 {
                inks[i].position.x = centerX - ((1.732 * radius) / 2)
                inks[i].position.y = centerY - ((1 * radius) / 2)
            } else if gotColors[i] == #colorLiteral(red: 0.24, green: 0.54, blue: 0.18, alpha: 1.00) {
                inks[i].position.x = centerX
                inks[i].position.y = centerY-radius
            } else if gotColors[i] == #colorLiteral(red: 0.44, green: 0.13, blue: 0.51, alpha: 1.00) {
                inks[i].position.x = centerX - ((1.732 * radius) / 2)
                inks[i].position.y = centerY + ((1 * radius) / 2)
            } else if gotColors[i] == #colorLiteral(red: 0.93, green: 0.38, blue: 0.17, alpha: 1.00) {
                inks[i].position.x = centerX + ((1.732 * radius) / 2)
                inks[i].position.y = centerY + ((1 * radius) / 2)
            } else if gotColors[i] == #colorLiteral(red: 0.24, green: 0.10, blue: 0.53, alpha: 1.00) {
                inks[i].position.x = centerX - radius
                inks[i].position.y = centerY
            } else if gotColors[i] == #colorLiteral(red: 0.11, green: 0.30, blue: 0.37, alpha: 1.00) {
                inks[i].position.x = centerX - radius/2
                inks[i].position.y = centerY - ((1.732 * radius) / 2)
            } else if gotColors[i] == #colorLiteral(red: 0.56, green: 0.71, blue: 0.22, alpha: 1.00) {
                inks[i].position.x = centerX + radius/2
                inks[i].position.y = centerY - ((1.732 * radius) / 2)
            } else if gotColors[i] == #colorLiteral(red: 0.95, green: 0.60, blue: 0.22, alpha: 1.00) {
                inks[i].position.x = centerX + radius
                inks[i].position.y = centerY
            } else if gotColors[i] == #colorLiteral(red: 0.93, green: 0.31, blue: 0.16, alpha: 1.00) {
                inks[i].position.x = centerX + radius/2
                inks[i].position.y = centerY + ((1.732 * radius) / 2)
            } else if gotColors[i] == #colorLiteral(red: 0.74, green: 0.16, blue: 0.26, alpha: 1.00) {
                inks[i].position.x = centerX - radius/2
                inks[i].position.y = centerY + ((1.732 * radius) / 2)
            }
        }
    }
}

//#colorLiteral
