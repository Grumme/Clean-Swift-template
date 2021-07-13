//
// LoginCollectionViewCell.swift
// Grumsen Development ApS
//
// Created by Greg Charyszczak on 16/06/2021.
//

import UIKit

class LoginCollectionViewCell: PressableCollectionViewCell {
  static let identifier = “LoginCollectionViewCell”

  // MARK: UI Views

  // MARK: UI Constants

  // MARK: Layers

  // MARK: Lifecycle Methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    resetCell()
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    themeRefresh()
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if let objectView = object as? UIView,
      objectView === self.cellIconImageViewContainer,
      keyPath == #keyPath(UIView.bounds) {
      self.cellIconImageViewContainerGradientLayer.frame = objectView.bounds
    }
  }

  deinit {
    self.cellIconImageViewContainer.addObserver(self, forKeyPath: #keyPath(UIView.bounds), options: .new, context: nil)
  }
}

// MARK: Initialization
extension LoginCollectionViewCell {
  private func commonInit() {
    self.cellIconImageViewContainer.removeObserver(self, forKeyPath: #keyPath(UIView.bounds))
    setupContentView()
    setupSubviews()
    setupSubviewsConstraints()
  }

  private func setupContentView() {
  }

  private func setupSubviews() {
  }

  private func setupSubviewsConstraints() {
  }
}

// MARK: Resetting
extension LoginCollectionViewCell {
  private func resetCell() {
      // Reset data on cell resuage
  }
}

// MARK: Setup
extension LoginCollectionViewCell {
    func setupCell() {
      // Setup cell after reuse

    }
}

// MARK: Theme refresh
extension LoginCollectionViewCell {
    func themeRefresh() {
        // Refresh cell on theme change
    }
}
