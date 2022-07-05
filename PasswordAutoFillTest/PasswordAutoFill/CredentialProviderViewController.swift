//
//  CredentialProviderViewController.swift
//  PasswordAutoFill
//
//  Created by Leo Ho on 2022/7/5.
//

import AuthenticationServices

class CredentialProviderViewController: ASCredentialProviderViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var passwordListTableView: UITableView!
    
    // MARK: - Variables
    
    var passwordListModel: [PasswordListModel] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordListTableView.delegate = self
        passwordListTableView.dataSource = self
        
        passwordListModel = [
            PasswordListModel(title: "5music", account: "zaqxsw0218", password: "zaqxsw0218"),
            PasswordListModel(title: "5music", account: "zaqxsw0219", password: "zaqxsw0219"),
            PasswordListModel(title: "5music", account: "zaqxsw0220", password: "zaqxsw0220"),
        ]
    }
    
    /*
     Prepare your UI to list available credentials for the user to choose from. The items in
     'serviceIdentifiers' describe the service the user is logging in to, so your extension can
     prioritize the most relevant credentials in the list.
    */
    override func prepareCredentialList(for serviceIdentifiers: [ASCredentialServiceIdentifier]) {

    }

    /*
     Implement this method if your extension supports showing credentials in the QuickType bar.
     When the user selects a credential from your app, this method will be called with the
     ASPasswordCredentialIdentity your app has previously saved to the ASCredentialIdentityStore.
     Provide the password by completing the extension request with the associated ASPasswordCredential.
     If using the credential would require showing custom UI for authenticating the user, cancel
     the request with error code ASExtensionError.userInteractionRequired.

    override func provideCredentialWithoutUserInteraction(for credentialIdentity: ASPasswordCredentialIdentity) {
        let databaseIsUnlocked = true
        if (databaseIsUnlocked) {
            let passwordCredential = ASPasswordCredential(user: "j_appleseed", password: "apple1234")
            self.extensionContext.completeRequest(withSelectedCredential: passwordCredential, completionHandler: nil)
        } else {
            self.extensionContext.cancelRequest(withError: NSError(domain: ASExtensionErrorDomain, code:ASExtensionError.userInteractionRequired.rawValue))
        }
    }
    */

    /*
     Implement this method if provideCredentialWithoutUserInteraction(for:) can fail with
     ASExtensionError.userInteractionRequired. In this case, the system may present your extension's
     UI and call this method. Show appropriate UI for authenticating the user then provide the password
     by completing the extension request with the associated ASPasswordCredential.

    override func prepareInterfaceToProvideCredential(for credentialIdentity: ASPasswordCredentialIdentity) {
    }
    */

    @IBAction func cancel(_ sender: AnyObject?) {
        self.extensionContext.cancelRequest(withError: NSError(domain: ASExtensionErrorDomain, code: ASExtensionError.userCanceled.rawValue))
    }

//    @IBAction func passwordSelected(_ sender: AnyObject?) {
//        let passwordCredential = ASPasswordCredential(user: "j_appleseed", password: "apple1234")
//        self.extensionContext.completeRequest(withSelectedCredential: passwordCredential, completionHandler: nil)
//    }

}

extension CredentialProviderViewController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwordListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PasswordListTableViewCell.identifier, for: indexPath) as? PasswordListTableViewCell else {
            fatalError("PasswordListTableViewCell 載入失敗")
        }
        cell.titleLabel.text = passwordListModel[indexPath.row].title
        cell.detailLabel.text = passwordListModel[indexPath.row].account
        cell.leftIconImageView.image = UIImage(systemName: "key.fill")
        return cell
    }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print(passwordListModel)
        let passwordCredential = ASPasswordCredential(user: passwordListModel[indexPath.row].account,
                                                      password: passwordListModel[indexPath.row].password)
        self.extensionContext.completeRequest(withSelectedCredential: passwordCredential, completionHandler: nil)
    }
}
