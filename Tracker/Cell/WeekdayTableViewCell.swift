import UIKit

protocol WeekdayTableViewCellDelegate: AnyObject {
    func switchStateChanged(for weekday: String?, isOn: Bool)
}

class WeekdayTableViewCell: UITableViewCell {
    
    //MARK: - Создание UI-Элементов
    
    lazy var weekdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var weekdaySwitch: UISwitch = {
        let weekdaySwitch = UISwitch()
        weekdaySwitch.translatesAutoresizingMaskIntoConstraints = false
        weekdaySwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        return weekdaySwitch
    }()

    weak var delegate: WeekdayTableViewCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setConstraints()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Настройка UI-Элементов
    
    private func addViews() {
        addSubview(weekdayLabel)
        addSubview(weekdaySwitch)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            weekdayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weekdayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            weekdaySwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            weekdaySwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }

    @objc func switchValueChanged(_ sender: UISwitch) {
        delegate?.switchStateChanged(for: weekdayLabel.text ?? "", isOn: sender.isOn)
    }
}
