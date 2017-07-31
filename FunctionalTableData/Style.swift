//
//  Style.swift
//  FunctionalTableData
//
//  Created by Raul Riera on 2017-07-25.
//  Copyright © 2017 Shopify. All rights reserved.
//

import Foundation
import UIKit

public struct Style {
	public static var selectionColor: UIColor? = nil // TODO: make this not a static like this
	public var bottomSeparator: Separator.Style?
	public var topSeparator: Separator.Style?
	public var highlight: Bool?
	public var accessoryType: UITableViewCellAccessoryType = .none
	public var selectionColor: UIColor? = Style.selectionColor
	public var backgroundColor: UIColor?
	public var tintColor: UIColor?
	public var layoutMargins: UIEdgeInsets?
	
	public init(topSeparator: Separator.Style? = nil,
	            bottomSeparator: Separator.Style? = nil,
	            highlight: Bool? = nil,
	            accessoryType: UITableViewCellAccessoryType = .none,
	            selectionColor: UIColor? = Style.selectionColor,
	            backgroundColor: UIColor? = nil,
	            tintColor: UIColor? = nil,
	            layoutMargins: UIEdgeInsets? = nil) {
		self.bottomSeparator = bottomSeparator
		self.topSeparator = topSeparator
		self.highlight = highlight
		self.accessoryType = accessoryType
		self.selectionColor = selectionColor
		self.backgroundColor = backgroundColor
		self.tintColor = tintColor
		self.layoutMargins = layoutMargins
	}
	
	func configure(cell: UITableViewCell, in tableView: UITableView) {
		if let separator = bottomSeparator {
			cell.applyBottomSeparator(separator)
		} else {
			cell.removeSeparator(Separator.Tag.bottom)
		}
		
		if let separator = topSeparator {
			cell.applyTopSeparator(separator)
		} else {
			cell.removeSeparator(Separator.Tag.top)
		}
		
		cell.backgroundColor = backgroundColor ?? UIColor.white
		let backgroundView = UIView()
		backgroundView.backgroundColor = cell.backgroundColor
		cell.backgroundView = backgroundView
		
		if let layoutMargins = layoutMargins {
			cell.contentView.layoutMargins = layoutMargins
		}
		
		if let tintColor = tintColor {
			cell.tintColor = tintColor
		}
		
		cell.selectionStyle = (highlight ?? false) ? .default : .none
		if let selectionColor = selectionColor {
			let selectedBackgroundView = UIView()
			selectedBackgroundView.backgroundColor = selectionColor
			cell.selectedBackgroundView = selectedBackgroundView
		} else {
			cell.selectedBackgroundView = nil
		}
		
		cell.accessoryType = accessoryType
	}
}

extension Style: Equatable {
	public static func ==(lhs: Style, rhs: Style) -> Bool {
		var equality = lhs.bottomSeparator == rhs.bottomSeparator
		equality = equality && lhs.topSeparator == rhs.topSeparator
		equality = equality && lhs.highlight == rhs.highlight
		equality = equality && lhs.accessoryType == rhs.accessoryType
		equality = equality && lhs.selectionColor == rhs.selectionColor
		equality = equality && lhs.backgroundColor == rhs.backgroundColor
		equality = equality && lhs.tintColor == rhs.tintColor
		equality = equality && lhs.layoutMargins == rhs.layoutMargins
		return equality
	}
}
