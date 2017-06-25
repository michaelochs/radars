//: A UIKit based Playground to present user interface
  
import UIKit
import PlaygroundSupport

class myViewController : UIViewController {

    let radius = 40.0
    var shapeLayer: CAShapeLayer!
    var slider: UISlider!

    override func viewDidLoad() {
        slider = UISlider(frame: CGRect(x: 10.0, y: 2.0 * radius + 30.0, width: 300.0, height: 20.0))
        slider.minimumValue = Float(radius)
        slider.maximumValue = Float(radius) * 2.0
        slider.addTarget(self, action: #selector(updateShape), for: .valueChanged)
        view.addSubview(slider)

        shapeLayer = CAShapeLayer()
        shapeLayer.frame = view.layer.bounds
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 1.0).cgColor
        shapeLayer.strokeColor = UIColor(red: 0.4, green: 0.4, blue: 1.0, alpha: 1.0).cgColor
        view.layer.addSublayer(shapeLayer)

        updateShape()
    }

    @objc
    func updateShape() {
        let width = Double(slider.value)
        let rect = CGRect(x: 10.0, y: 10.0, width: width, height: radius * 2.0)
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: radius, height: radius))
        shapeLayer?.path = path.cgPath

    }

}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = myViewController()

