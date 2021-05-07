
import UIKit
import AVFoundation

public class PsycoViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    var memoji = UIImageView()
    var imagesMemoji: [String] = ["memojiBlue", "memojiRed", "memojiYellow", "memojiGreen","memojiBlack", "memojiWhite", "memojiOrange", "memojiViolet", "memojiPink", "memojiBrown", "memojiGray"]
    var colorButtons: [UIButton] = []
    var images: [String] = ["blue", "red", "yellow", "green", "black", "white", "orange", "violet", "pink", "brown", "gray"]
    var cores: [UIColor] = [#colorLiteral(red: 0.21, green: 0.43, blue: 0.70, alpha: 1.00),#colorLiteral(red: 0.67, green: 0.17, blue: 0.14, alpha: 1.00),#colorLiteral(red: 0.87, green: 0.80, blue: 0.26, alpha: 1.00),#colorLiteral(red: 0.22, green: 0.49, blue: 0.20, alpha: 1.00),#colorLiteral(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00),#colorLiteral(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00),#colorLiteral(red: 0.93, green: 0.47, blue: 0.19, alpha: 1.00),#colorLiteral(red: 0.36, green: 0.24, blue: 0.46, alpha: 1.00),#colorLiteral(red: 0.85, green: 0.42, blue: 0.69, alpha: 1.00),#colorLiteral(red: 0.35, green: 0.20, blue: 0.13, alpha: 1.00),#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)]
    var emocoesTexto: [String] = ["TECHNOLOGY | FRIENDSHIP | CALM","PASSION | NOBILITY | APPETITE","HAPPINESS | OPTIMISM | INTELLIGENCE","NATURE | HOPE | HEALTH","SADNESS | EVIL | AUTHORITY","PEACE | INNOCENCE | SIMPLICITY","FUN | CREATIVITY | YOUTH","POWER | MAGIC | LUST","DELICACY | KINDNESS | ROMANTICISM","EARTH | WEALTH | CHOCOLATE","NEUTRALITY | INDIFFERENCE | OLD AGE"]
    var feelingsClicked = UILabel()
    var nameClicked = UILabel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3913005292415619, green: 0.6626309156417847, blue: 1.0254673957824707, alpha: 1.0)
        
        memoji.image = UIImage(named: "exclamacao")
        view.addSubview(memoji)
        
        memoji.contentMode = .scaleAspectFit
        //Posicao memoji
        memoji.translatesAutoresizingMaskIntoConstraints = false //ignora frame
        memoji.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        memoji.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height*0.15).isActive = true
        memoji.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        memoji.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        memoji.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        //Criando labels
        nameClicked.font = UIFont(name: "AppleColorEmoji", size: 50)
        nameClicked.textColor = .white
        nameClicked.text = "?"
        nameClicked.layer.cornerRadius = 80
        view.addSubview(nameClicked)
        
        feelingsClicked.font = UIFont(name: "AppleColorEmoji", size: 30)
        feelingsClicked.textColor = .white
        feelingsClicked.textAlignment = .center
        feelingsClicked.numberOfLines = 3
        feelingsClicked.lineBreakMode = .byWordWrapping
        feelingsClicked.text = "?"
        view.addSubview(feelingsClicked)
        
        // Posicionando Labels
        nameClicked.translatesAutoresizingMaskIntoConstraints = false
        
        nameClicked.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameClicked.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        feelingsClicked.translatesAutoresizingMaskIntoConstraints = false
        
        feelingsClicked.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        feelingsClicked.centerYAnchor.constraint(equalTo: nameClicked.centerYAnchor, constant: 80).isActive = true
        feelingsClicked.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        createButtons()
        
        positionButtons()
    }
    
    
    func createButtons() {
        for i in 0...10{
            var button = UIButton()
            button.tag = i
            button.setImage(UIImage(named: images[i]), for: .normal)
            button.addTarget(self, action: #selector(updatesColor), for: .touchUpInside)
            view.addSubview(button)
            colorButtons.append(button)
        }
    }
    
    func positionButtons(){
        //Botao branco - centro da linha
        colorButtons[5].translatesAutoresizingMaskIntoConstraints = false
        colorButtons[5].centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorButtons[5].bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        colorButtons[5].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09).isActive = true
        colorButtons[5].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09).isActive = true
        
        var contador1 = 4
        while contador1>=0{
            colorButtons[contador1].translatesAutoresizingMaskIntoConstraints = false
            colorButtons[contador1].rightAnchor.constraint(equalTo: colorButtons[contador1+1].leftAnchor).isActive = true
            colorButtons[contador1].bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
            colorButtons[contador1].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09).isActive = true
            colorButtons[contador1].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09).isActive = true
            contador1 -= 1
        }
        
        for i in 6..<11{
            colorButtons[i].translatesAutoresizingMaskIntoConstraints = false
            colorButtons[i].leftAnchor.constraint(equalTo: colorButtons[i-1].rightAnchor).isActive = true
            colorButtons[i].bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
            colorButtons[i].heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09).isActive = true
            colorButtons[i].widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.09).isActive = true
        }
    }
    
    @objc func updatesColor(sender: UIButton){
        if let audioFile = Bundle.main.url(forResource: "click", withExtension: "m4a") {
            do {
                try self.audioPlayer = AVAudioPlayer(contentsOf: audioFile)
                self.audioPlayer?.numberOfLoops = 0
                self.audioPlayer?.play()
            } catch {
                print("Erro ao tentar tocar o som: \(error)")
            }
        } else {
            print("Audio não encontrado")
        }
        nameClicked.textColor = .white
        feelingsClicked.textColor = .white
        if sender.tag == 2 || sender.tag == 5 {
            nameClicked.textColor = .black
            feelingsClicked.textColor = .black
        }
        view.backgroundColor = cores[sender.tag]
        nameClicked.text = images[sender.tag].uppercased()
        memoji.image = UIImage(named: imagesMemoji[sender.tag])
        feelingsClicked.text = emocoesTexto[sender.tag]
    }
}

//#colorLiteral
