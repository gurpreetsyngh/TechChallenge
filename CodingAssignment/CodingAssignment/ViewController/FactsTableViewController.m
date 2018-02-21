//
//  FactsTableViewController.m
//  CodingAssignment
//
//  Created by Gurpreet Singh on 21/2/18.
//  Copyright © 2018 GurpreetSingh. All rights reserved.
//

#import "FactsTableViewController.h"
#import "FactsCustomCellTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DataManager.h"
#import "StyleManager.h"
#import "Fact.h"

static NSString * const CellIdentifier = @"FactsCustomCell";

@interface FactsTableViewController ()

@property(nonatomic, strong) NSMutableArray<Fact *> *facts;

@end

@implementation FactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    self.tableView.estimatedRowHeight = 44;
    self.refreshControl = [[UIRefreshControl alloc]init];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self action:@selector(getFacts) forControlEvents:(UIControlEventValueChanged)];
    [self.refreshControl setTintColor:[StyleManager secondaryColor]];
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Updating Data..." attributes: @{NSForegroundColorAttributeName:[StyleManager primaryColor]}];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithAttributedString:title];
    [self getFacts];
}

- (void)getFacts {
     __weak __typeof__(self) weakSelf = self;
    [DataManager getFacts:^(NSString * _Nullable title, NSArray * _Nullable data, NSError * _Nullable error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf showError:error.localizedDescription];
                if (weakSelf.refreshControl.isRefreshing) {
                    [weakSelf.refreshControl endRefreshing];
                }
            });
        } else {
            weakSelf.facts = [[weakSelf filterArray:data] mutableCopy];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.navigationItem.title = title;
                [weakSelf.tableView reloadData];
                if (weakSelf.refreshControl.isRefreshing) {
                    [weakSelf.refreshControl endRefreshing];
                }
            });
        }
    }];
}

/*
 * showError will display the error using tableView's background view
 * @param: reason for which error occured
 */
- (void)showError:(NSString *)reason {
    UILabel *messageLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
    messageLbl.text = reason;
    messageLbl.textAlignment = NSTextAlignmentCenter;
    [messageLbl sizeToFit];
    self.tableView.backgroundView = messageLbl;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

/*
 * filterArray will filter the passed array and returns the array where title is available
 * @param: return: list of filtered objects
 */
- (NSArray *)filterArray:(NSArray *)inArray {
    NSArray *filteredArray = [inArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Fact* evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return evaluatedObject.title.length > 0;
    }]];
    return filteredArray;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {
    return self.facts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FactsCustomCellTableViewCell *cell = (FactsCustomCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[FactsCustomCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Fact *fact = self.facts[indexPath.row];
    cell.titleLabel.text = fact.title;
    cell.descriptionLabel.text = fact.factDescription;
    
    UIImage *image = fact.image;
    if (fact.imageURL) {
        if (image) { //check image is available, use image, else make network request to download image
            cell.thumbnailImage.image = image;
            if (cell.activityIndicator.isAnimating) {
                [cell.activityIndicator stopAnimating];
            }
        }
        else {
            [cell.activityIndicator startAnimating];
            [cell.thumbnailImage sd_setImageWithURL:[NSURL URLWithString:fact.imageURL] placeholderImage:[UIImage imageNamed:@"placeholder.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (image) {
                    Fact *fact = self.facts[indexPath.row];
                    fact.image = image;
                    [self.facts replaceObjectAtIndex:indexPath.row withObject:fact];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.thumbnailImage.image = fact.image;
                        [cell.activityIndicator stopAnimating];
                    });
                } else {
                    cell.thumbnailImage.image = [UIImage imageNamed:@"error.png"];
                    [cell.activityIndicator stopAnimating];
                }
            }];
            
        }
    } else {
        cell.thumbnailImage.image = [UIImage imageNamed:@"no image.png"];
        fact.image =  cell.thumbnailImage.image;
        [cell.activityIndicator stopAnimating];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
