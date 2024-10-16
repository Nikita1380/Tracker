import UIKit

final class OnboardingViewController: UIViewController {
    
    private var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.tintColor = .ypWhite
        button.backgroundColor = .ypBlackDay
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Вот это технологии!", for: .normal)
        return button
    }()
    
    private var typeTitle: UILabel = {
        let typeTitle = UILabel()
        typeTitle.textColor = .ypBlackDay
        typeTitle.font = .systemFont(ofSize: 32, weight: .bold)
        typeTitle.numberOfLines = 2
        typeTitle.textAlignment = .center
        return typeTitle
    }()
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    init(image: String, text: String) {
        self.typeTitle.text = text
        self.image.image = UIImage(named: image) ?? UIImage()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

extension OnboardingViewController {
    private func setupUI() {
        [image, typeTitle, doneButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.widthAnchor.constraint(equalTo: view.widthAnchor),
            image.heightAnchor.constraint(equalTo: view.heightAnchor),

            typeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 432),
            typeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            typeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            typeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            doneButton.heightAnchor.constraint(equalToConstant: 60),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 668)
        ])
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        guard let window = UIApplication.shared.windows.first else {
            assertionFailure("Invalid Configuration")
            return
        }

        window.rootViewController = TabBarController()
    }
}
