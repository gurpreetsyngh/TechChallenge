//
//  FactsCustomCellTableViewCell.h
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactsCustomCellTableViewCell : UITableViewCell

@property (nonatomic, strong)  UILabel *titleLabel;
@property (nonatomic, strong)  UILabel *descriptionLabel;
@property (nonatomic, strong)  UIImageView *thumbnailImage;
@property (nonatomic, strong)  UIActivityIndicatorView *activityIndicator;

@end
