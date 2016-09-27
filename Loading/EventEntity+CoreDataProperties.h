//
//  EventEntity+CoreDataProperties.h
//  Loading
//
//  Created by ml on 16/9/27.
//  Copyright © 2016年 李博文. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EventEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *eventDate;
@property (nullable, nonatomic, retain) NSString *eventName;
@property (nullable, nonatomic, retain) NSData *eventNotes;
@property (nullable, nonatomic, retain) NSManagedObject *countDown;
@property (nullable, nonatomic, retain) AnniversaryModel *anniversary;

@end

NS_ASSUME_NONNULL_END
