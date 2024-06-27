//
//  GoalExpenditureTableViewCell.swift
//  Saver
//
//  Created by 조성빈 on 6/28/24.
//

import UIKit

class GoalExpenditureTableViewCell: UITableViewCell {
    
    private var category: UILabel = UILabel()
    private var mainTitle: UILabel = UILabel()
    private var subTitle: UILabel = UILabel()
    private var VStackView: UIStackView = UIStackView()
    
    private var editButton: UIButton = UIButton(type: .system)
    private var HStackView: UIStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupVStackView()
        setupHStackView()
        
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    //MARK: - Vertical StackView setup
    func setupVStackView() {
        category.text = "식비"
        category.font = .preferredFont(forTextStyle: .callout)
        mainTitle.text = "지출 목표 300,000원에서\n8,000원 초과"
        mainTitle.numberOfLines = 0
        mainTitle.font = .preferredFont(forTextStyle: .title3)
        subTitle.text = "현재 누적 지출 금액 308,000원"
        subTitle.font = .preferredFont(forTextStyle: .caption1)
        
        VStackView.axis = .vertical
        VStackView.distribution = .fill
        VStackView.spacing = 10
        VStackView.alignment = .leading
        VStackView.backgroundColor = .green
        
        VStackView.addArrangedSubview(category)
        VStackView.addArrangedSubview(mainTitle)
        VStackView.addArrangedSubview(subTitle)
    }
    
    //MARK: - HStackView setup
    func setupHStackView() {
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        editButton.configuration = config
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        
        
        HStackView.axis = .horizontal
        HStackView.distribution = .fill
        HStackView.alignment = .top
        
        HStackView.addArrangedSubview(VStackView)
        HStackView.addArrangedSubview(editButton)
        
        HStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(HStackView)
        
        NSLayoutConstraint.activate([
            HStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            HStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            HStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            HStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
}
