import UIKit
import PlaygroundSupport
class ViewController: UIViewController {

    private let displayLabel = UILabel()
    private var currentInput = ""
    private var previousValue: Double?
    private var currentOperator: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDisplayLabel()
        setupButtons()
    }

    private func setupDisplayLabel() {
        displayLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 60)
        displayLabel.backgroundColor = .lightGray
        displayLabel.textColor = .black
        displayLabel.font = UIFont.systemFont(ofSize: 32)
        displayLabel.textAlignment = .right
        displayLabel.text = "0"
        view.addSubview(displayLabel)
    }

    private func createButton(title: String, x: CGFloat, y: CGFloat, action: Selector) {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: x, y: y, width: 80, height: 80)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        view.addSubview(button)
    }

    private func setupButtons() {
        let titles = [
            ["7", "8", "9", "/"],
            ["4", "5", "6", "*"],
            ["1", "2", "3", "-"],
            ["0", "C", "=", "+"]
        ]

        let startX: CGFloat = 20
        var y: CGFloat = 180

        for row in titles {
            var x = startX
            for title in row {
                if title == "C" {
                    createButton(title: title, x: x, y: y, action: #selector(clearTapped))
                } else if "+-*/=".contains(title) {
                    createButton(title: title, x: x, y: y, action: #selector(operatorTapped(_:)))
                } else {
                    createButton(title: title, x: x, y: y, action: #selector(numberTapped(_:)))
                }
                x += 90
            }
            y += 90
        }
    }

    @objc private func numberTapped(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        currentInput += digit
        displayLabel.text = currentInput
    }

    @objc private func operatorTapped(_ sender: UIButton) {
        guard let op = sender.currentTitle else { return }

        if op == "=" {
            calculateResult()
        } else {
            if let value = Double(currentInput) {
                previousValue = value
                currentInput = ""
                currentOperator = op
            }
        }
    }

    private func calculateResult() {
        guard
            let op = currentOperator,
            let prev = previousValue,
            let current = Double(currentInput)
        else { return }

        var result: Double = 0

        switch op {
        case "+":
            result = prev + current
        case "-":
            result = prev - current
        case "*":
            result = prev * current
        case "/":
            result = current == 0 ? Double.nan : prev / current
        default:
            break
        }

        displayLabel.text = result.isNaN ? "Error" : String(result)
        currentInput = ""
        previousValue = nil
        currentOperator = nil
    }

    @objc private func clearTapped() {
        currentInput = ""
        previousValue = nil
        currentOperator = nil
        displayLabel.text = "0"
    }
}

PlaygroundPage.current.liveView = ViewController()
