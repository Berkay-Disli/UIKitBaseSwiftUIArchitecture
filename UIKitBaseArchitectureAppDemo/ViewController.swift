//
//  ViewController.swift
//  UIKitBaseArchitectureAppDemo
//
//  Created by BERKAY DISLI on 18.10.2024.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupSwiftUIView(ContentView(title: "Home", navigateAction: navigateToDetails))
    }
    
    func navigateToDetails() {
        navigationController?.pushViewController(DetailsViewController(title: "Home Details"), animated: true)
    }
}

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        setupSwiftUIView(ContentView(title: "Search", navigateAction: navigateToDetails))
    }
    
    func navigateToDetails() {
        navigationController?.pushViewController(DetailsViewController(title: "Search Details"), animated: true)
    }
}

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        setupSwiftUIView(ContentView(title: "Profile", navigateAction: navigateToDetails))
    }
    
    func navigateToDetails() {
        navigationController?.pushViewController(DetailsViewController(title: "Profile Details"), animated: true)
    }
}

class DetailsViewController: UIViewController {
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView(DetailsView(title: title ?? "Details"))
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension UIViewController {
    func setupSwiftUIView<Content: View>(_ swiftUIView: Content) {
        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
        hostingController.navigationItem.largeTitleDisplayMode = .always
        hostingController.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

struct ContentView: View {
    let title: String
    let navigateAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Welcome to \(title)")
            Button("Go to Details") {
                navigateAction()
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct DetailsView: View {
    let title: String
    
    var body: some View {
            Text("This is the \(title) view")
                .navigationTitle(title)
    }
}

#Preview {
    HomeViewController()
}
