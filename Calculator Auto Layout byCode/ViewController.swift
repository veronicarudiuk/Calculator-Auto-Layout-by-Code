//
//  ViewController.swift
//  Calculator Auto Layout byCode
//
//  Created by Veronica Rudiuk on 18.10.22.
//

import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
    }
    
    func createStackView() {
        
        //        создание и настройка перой строчки в вьюхой (вьюха для того, чтобы можно было сделать отступ)
        lazy var input = UILabel(text: "0")
        
        let inputView = UIView()
        inputView.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
        inputView.addSubview(input)
        
        input.translatesAutoresizingMaskIntoConstraints = false
        input.trailingAnchor.constraint(equalTo: inputView.trailingAnchor, constant: -20).isActive = true
        input.bottomAnchor.constraint(equalTo: inputView.bottomAnchor, constant: -10).isActive = true
        
        //         создание остальных лейблов
        let ac = UILabel(text: "AC")
        let adding = UILabel(text: "+/-")
        let percent = UILabel(text: "%")
        let division = UILabel(text: "÷")
        let seven = UILabel(text: "7")
        let eight = UILabel(text: "8")
        let nine = UILabel(text: "9")
        let multiplication = UILabel(text: "×")
        let four = UILabel(text: "4")
        let five = UILabel(text: "5")
        let six = UILabel(text: "6")
        let minus = UILabel(text: "-")
        let one = UILabel(text: "1")
        let two = UILabel(text: "2")
        let three = UILabel(text: "3")
        let plus = UILabel(text: "+")
        let zero = UILabel(text: "0")
        let dot = UILabel(text: ".")
        let equally = UILabel(text: "=")
        
        for i in [division, multiplication, minus, plus, equally] { i.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.5765935183, blue: 0, alpha: 1) }
        for i in [adding, percent, ac] { i.backgroundColor = #colorLiteral(red: 0.3333333135, green: 0.3333333433, blue: 0.3333333433, alpha: 1) }
        input.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
        
        //        добавление лейблов в стек вьюхи
        let oneStackView = UIStackView(arrangedSubviews: [inputView], axis: .horizontal)
        let twoStackView = UIStackView(arrangedSubviews: [ac, adding, percent, division], axis: .horizontal)
        let threeStackView = UIStackView(arrangedSubviews: [seven, eight, nine, multiplication], axis: .horizontal)
        let fourStackView = UIStackView(arrangedSubviews: [four, five, six, minus], axis: .horizontal)
        let fiveStackView = UIStackView(arrangedSubviews: [one, two, three, plus], axis: .horizontal)
        let halfSixStackView = UIStackView(arrangedSubviews: [dot, equally], axis: .horizontal)
        let sixStackView = UIStackView(arrangedSubviews: [zero, halfSixStackView], axis: .horizontal)
        
        //        создание главной стек вьюхи
        let mainStackView = UIStackView(arrangedSubviews: [oneStackView, twoStackView, threeStackView, fourStackView, fiveStackView, sixStackView], axis: .vertical)
        
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:0).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}

// расширение для UILabel с настройкой внешнего вида и возможностью при объявлении лейбла сразу указывать ему текст
extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        textColor = .white
        backgroundColor = #colorLiteral(red: 0.1420841515, green: 0.6790947914, blue: 0.9716047645, alpha: 1)
        font = .systemFont(ofSize: 40)
        textAlignment = .center
    }
}

// расширение для UIStackView с настройкой внешнего вида и возможностью при объявлении сразу указывать ему направление
extension UIStackView {
    convenience init ( arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 1, distribution: UIStackView.Distribution = .fillEqually) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
}

// возможность просматривать превью при помощи свифт юая
struct SwiftUIController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

struct SwiftUIController_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIController().edgesIgnoringSafeArea(.all)
    }
}
