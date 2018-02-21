//
//  FactsCustomCellTableViewCell.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "FactsCustomCellTableViewCell.h"
#import "Masonry.h"

@implementation FactsCustomCellTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.thumbnailImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.thumbnailImage];
        self.thumbnailImage.contentMode = UIViewContentModeScaleAspectFit;
        self.thumbnailImage.clipsToBounds = YES;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.font = [UIFont fontWithName:@"Arial" size:18.0f];
        [self.contentView addSubview:self.titleLabel];
        
        self.descriptionLabel = [[UILabel alloc] init];
        self.descriptionLabel.textColor = [UIColor grayColor];
        self.descriptionLabel.numberOfLines = 0;
        self.descriptionLabel.textAlignment = NSTextAlignmentLeft;
        self.descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.descriptionLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        [self.contentView addSubview:self.descriptionLabel];
        
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.activityIndicator.alpha = 1.0;
        self.activityIndicator.hidden = NO;
        self.activityIndicator.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height/2 - 64);
        [self.thumbnailImage addSubview:self.activityIndicator];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    
    [self.thumbnailImage mas_remakeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.leading.equalTo(self.contentView.mas_leading).with.offset(10);
        make.width.height.equalTo(@100);
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom).offset(-10).priorityMedium();
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(10);
        make.leading.equalTo(self.thumbnailImage.mas_trailing).with.offset(10);
        make.trailing.equalTo(self.contentView.mas_trailing).with.offset(-10);
    }];
    
    [self.descriptionLabel mas_remakeConstraints:^(MASConstraintMaker* make) {
        make.leading.equalTo(self.titleLabel.mas_leading);
        make.trailing.equalTo(self.contentView.mas_trailing).with.offset(-10);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom).offset(-10).priorityMedium();
    }];
    
    [self.activityIndicator mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.thumbnailImage);
    }];
    
    [super updateConstraints];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.thumbnailImage.image = nil;
    self.titleLabel.text = nil;
    self.descriptionLabel.text = nil;
}

@end
