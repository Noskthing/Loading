//
//  AnniversaryModel+CoreDataProperties.h
//  Loading
//
//  Created by ml on 16/9/27.
//  Copyright © 2016年 李博文. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AnniversaryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AnniversaryModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSManagedObject *event;

@end

NS_ASSUME_NONNULL_END
