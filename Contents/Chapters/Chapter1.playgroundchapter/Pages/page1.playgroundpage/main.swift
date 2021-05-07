/*:
 
 Hi! My name is Luca, I'm brazilian and I love to learn new things. So in this challenge, I decided to learn about something that is very present in my life, the colors!
 
 # What is color?
 
 Color is the light that arrives in our eyes, every object around us when hit by light absorbs a part of it and reflects the rest, our eyes captures this rest of light and we understand this as color.

 # The three big groups
 
 We can divide the colors in three big groups:

 **Primary** - The colors that we can't produce mixing other colors, there is just 3 colors in this group: Red, Yellow and Blue. With these colors we can produce all other colors.

 **Secondary** - The colors formed from the mixture between two primary colors producing three more colors: Violet (Blue + Red), Green (Blue + Yellow) and Orange (Red + Yellow).

 **Tertiary** - The colors formed from the mixture between a primary color and a secondary color producing six more colors: Blue-Violet, Red-Violet, Red-Orange, Yellow-Orange, Yellow-Green, Blue-Green.

 # Chromatic circle
 
 A lot of colors, right? But how can we see it all in a simpler way? We can do this using the chromatic circle, a tool that allows us to have an orderly and circular representation of colors composed with the 12 colors previously spoken.
 
 ![Chromatic Circle](imageCircle1.png)

 - Important:
 Now you need to create the chromatic circle! Rules:
 \
 -You just start with the three primary colors (.red, .blue and .yellow);
 \
 -You need to use this colors: .blue, .yellow, .red, .violet, .green and .orange;
 \
 -To create the other colors use the function mixColors(color1: .color, color2: .color);
 */
/*:
 - Example:
 *Creating the violet color*\
 \
 `mixColors(color1: .blue, color2: .red)`
 
*/

//#-hidden-code
import Psyco
import PlaygroundSupport

let art = ArtViewController()

enum Colors: String {
    case blue = "Blue"
    case yellow = "Yellow"
    case red = "Red"
    case violet = "Violet"
    case orange = "Orange"
    case green = "Green"
    case empty = ""
}

func mixColors(color1: Colors, color2: Colors){
    contador += 1 //Contador para saber qual mistura deu errada
    //Mistura cores primarias -> vai criar 9 cores diferentes -> cada cor tem 2 variacoes de entrada -> 9 if com 2 variacoes de entradas
    if (color1 == .blue && color2 == .yellow) || (color1 == .yellow && color2 == .blue){ //Green
        art.scene.gotColors.append(#colorLiteral(red: 0.24, green: 0.54, blue: 0.18, alpha: 1.00))
    } else if (color1 == .blue && color2 == .red) || (color1 == .red && color2 == .blue){ //Violet
        art.scene.gotColors.append(#colorLiteral(red: 0.44, green: 0.13, blue: 0.51, alpha: 1.00))
    } else if (color1 == .yellow && color2 == .red) || (color1 == .red && color2 == .yellow){ //Orange
        art.scene.gotColors.append(#colorLiteral(red: 0.93, green: 0.38, blue: 0.17, alpha: 1.00))
    } else if (((color1 == .blue && color2 == .violet) || (color1 == .violet && color2 == .blue)) && art.scene.gotColors.contains(#colorLiteral(red: 0.44, green: 0.13, blue: 0.51, alpha: 1.00))){ //Blue-Violet
        art.scene.gotColors.append(#colorLiteral(red: 0.24, green: 0.10, blue: 0.53, alpha: 1.00))
    } else if (((color1 == .blue && color2 == .green) || (color1 == .green && color2 == .blue)) && art.scene.gotColors.contains(#colorLiteral(red: 0.24, green: 0.54, blue: 0.18, alpha: 1.00))){ //Blue-Green
        art.scene.gotColors.append(#colorLiteral(red: 0.11, green: 0.30, blue: 0.37, alpha: 1.00))
    } else if (((color1 == .yellow && color2 == .green) || (color1 == .green && color2 == .yellow)) && art.scene.gotColors.contains(#colorLiteral(red: 0.24, green: 0.54, blue: 0.18, alpha: 1.00))){ //Yellow-Green
        art.scene.gotColors.append(#colorLiteral(red: 0.56, green: 0.71, blue: 0.22, alpha: 1.00))
    } else if (((color1 == .yellow && color2 == .orange) || (color1 == .orange && color2 == .yellow)) && art.scene.gotColors.contains(#colorLiteral(red: 0.93, green: 0.38, blue: 0.17, alpha: 1.00))){ //Yellow-Orange
        art.scene.gotColors.append(#colorLiteral(red: 0.95, green: 0.60, blue: 0.22, alpha: 1.00))
    } else if (((color1 == .red && color2 == .orange) || (color1 == .orange && color2 == .red)) && art.scene.gotColors.contains(#colorLiteral(red: 0.93, green: 0.38, blue: 0.17, alpha: 1.00))){ //Red-Orange
        art.scene.gotColors.append(#colorLiteral(red: 0.93, green: 0.31, blue: 0.16, alpha: 1.00))
    } else if (((color1 == .red && color2 == .violet) || (color1 == .violet && color2 == .red)) && art.scene.gotColors.contains(#colorLiteral(red: 0.44, green: 0.13, blue: 0.51, alpha: 1.00))){ //Red-Violet
        art.scene.gotColors.append(#colorLiteral(red: 0.74, green: 0.16, blue: 0.26, alpha: 1.00))
    } else {
        if errou == false {
            art.scene.falta.text = "Wrong mixtures:"
            errou = true
        }
        var myString = String(contador)
        art.scene.texto.text = "You mixed something wrong!"
        art.scene.falta.text! += myString
    }
}

art.scene.titulo.text = "Mix the colors"
var contador: Int = 0
var errou = false
//#-end-hidden-code
// Mixture 1
mixColors(color1: /*#-editable-code*/.blue/*#-end-editable-code*/, color2: /*#-editable-code*/.yellow/*#-end-editable-code*/)
// Mixture 2
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)
// Mixture 3
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)
// Mixture 4
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)
// Mixture 5
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)
// Mixture 6
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)
// Mixture 7
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)
// Mixture 8
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)
// Mixture 9
mixColors(color1: /*#-editable-code*/.empty/*#-end-editable-code*/, color2: /*#-editable-code*/.empty/*#-end-editable-code*/)

//#-hidden-code
art.scene.falta.lineBreakMode = .byWordWrapping
art.scene.falta.numberOfLines = 3

PlaygroundPage.current.setLiveView(art)
//#-end-hidden-code
