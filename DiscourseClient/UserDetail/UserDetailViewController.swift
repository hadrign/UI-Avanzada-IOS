//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Hadrian Grille Negreira on 11/04/2020.
//  Copyright © 2020 Roberto Garrido. All rights reserved.
//

import UIKit

/// ViewController que representa el detalle de un User
class UserDetailViewController: UIViewController {
    
    var canEdit: Bool = false

    lazy var labelUserID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelUserName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var editUserName: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var buttonEditUsername: UIButton = {
        let editUsernameButton = UIButton(type: .system)
        editUsernameButton.translatesAutoresizingMaskIntoConstraints = false
        editUsernameButton.setTitle(NSLocalizedString("Edit Username", comment: ""), for: .normal)
        editUsernameButton.backgroundColor = .green
        editUsernameButton.setTitleColor(.white, for: .normal)
        editUsernameButton.isHidden = true
        editUsernameButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return editUsernameButton
    }()

    lazy var userIDStackView: UIStackView = {
        let labelUserIDTitle = UILabel()
        labelUserIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelUserIDTitle.text = NSLocalizedString("User ID: ", comment: "")
        labelUserIDTitle.textColor = .black

        let userIDStackView = UIStackView(arrangedSubviews: [labelUserIDTitle, labelUserID])
        userIDStackView.translatesAutoresizingMaskIntoConstraints = false
        userIDStackView.axis = .horizontal

        return userIDStackView
    }()

    lazy var userNameStackView: UIStackView = {
        let labelUsernameTitle = UILabel()
        labelUsernameTitle.text = NSLocalizedString("Name: ", comment: "")
        labelUsernameTitle.translatesAutoresizingMaskIntoConstraints = false

        let userNameStackView = UIStackView(arrangedSubviews: [labelUsernameTitle, labelUserName])
        userNameStackView.translatesAutoresizingMaskIntoConstraints = false
        userNameStackView.axis = .horizontal

        return userNameStackView
    }()
    
    lazy var userNameEditableStackView: UIStackView = {
        let labelUsernameEditTitle = UILabel()
        labelUsernameEditTitle.text = NSLocalizedString("Name Editable: ", comment: "")
        labelUsernameEditTitle.translatesAutoresizingMaskIntoConstraints = false

        let userNameEditableStackView = UIStackView(arrangedSubviews: [labelUsernameEditTitle, editUserName])
        userNameEditableStackView.translatesAutoresizingMaskIntoConstraints = false
        userNameEditableStackView.axis = .horizontal

        return userNameEditableStackView
    }()
    
    

    let viewModel: UserDetailViewModel

    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        view.addSubview(userNameStackView)
        NSLayoutConstraint.activate([
            userNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userNameStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 8)
        ])
        
        view.addSubview(userNameEditableStackView)
        NSLayoutConstraint.activate([
            userNameEditableStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userNameEditableStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 8)
        ])
        

        view.addSubview(buttonEditUsername)
        NSLayoutConstraint.activate([
            buttonEditUsername.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            buttonEditUsername.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            buttonEditUsername.topAnchor.constraint(equalTo: userNameEditableStackView.bottomAnchor, constant: 8)
        ])

        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    @objc func backButtonTapped() {
        viewModel.backButtonTapped()
    }

    fileprivate func showErrorFetchingUserDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching user detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }

    fileprivate func updateUI() {
        labelUserID.text = viewModel.labelUserIDText
        labelUserName.text = viewModel.labelUserNameText
        editUserName.text = labelUserName.text
        canEdit = viewModel.buttonCanEdit ?? false
        if canEdit {
            userNameStackView.isHidden = true
            userNameEditableStackView.isHidden = false
            buttonEditUsername.isHidden = false
        } else {
            userNameStackView.isHidden = false
            userNameEditableStackView.isHidden = true
            buttonEditUsername.isHidden = true
        }
    }
    
    @objc fileprivate func editButtonTapped() {
        guard let username = labelUserName.text, !username.isEmpty else { return }
        guard let newUsername = editUserName.text, !newUsername.isEmpty else { return }
        viewModel.changeButtonTapped(userName: username, newUserName: newUsername)
    }
    
    fileprivate func showErrorEditingUserAlert() {
        let message = NSLocalizedString("Error editing username\nPlease try again later", comment: "")
        showAlert(message)
    }
    
    fileprivate func showEditingUserAlert() {
        let message = NSLocalizedString("Username has been editted", comment: "")
        showAlert(message)
    }
}

extension UserDetailViewController: UserDetailViewDelegate {
    func userDetailFetched() {
        updateUI()
    }
    
    func errorFetchingUserDetail() {
        showErrorFetchingUserDetailAlert()
    }
    
    func usernameChanged() {
        showEditingUserAlert()
    }
    
    func errorChangingUsername() {
        showErrorEditingUserAlert()
    }
}

