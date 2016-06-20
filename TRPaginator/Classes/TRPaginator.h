////////////////////////////////////////////////////////////////////////////////
//
//  TRPaginator.h
//  TRPaginator
//
//  Created by iOSTrek on 6/20/16.
//  Copyright © 2016 iOSTrek. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////
#import <Foundation/Foundation.h>

////////////////////////////////////////////////////////////////////////////////
/*!
 *  @brief Request Status.
 */
typedef NS_ENUM(NSInteger, TRRequestStatus) {
  /*!
   *  None.
   */
  TRRequestStatusNone = 0,
  /*!
   *  In Progress.
   */
  TRRequestStatusInProgress = 1,
  /*!
   *  Finished (Succeded of Failed).
   */
  TRRequestStatusFinished = 2
};

////////////////////////////////////////////////////////////////////////////////
@protocol TRPaginatorDelegate<NSObject>

@required
- (void)paginator:(id)paginator didReceiveResults:(NSArray *)results;

@optional
- (void)paginatorDidFailed:(id)paginator;
- (void)paginatorDidReset:(id)paginator;

@end

////////////////////////////////////////////////////////////////////////////////
@interface TRPaginator : NSObject

@property(weak, nonatomic) id<TRPaginatorDelegate> delegate;

@property(assign, nonatomic) NSInteger page;
@property(assign, nonatomic) NSInteger pageSize;
@property(assign, nonatomic) NSInteger total;

@property(strong, nonatomic, readonly) NSMutableArray *results;

@property(assign, nonatomic) TRRequestStatus requestStatus;

- (instancetype)initWithPageSize:(NSInteger)pageSize
                        delegate:(id<TRPaginatorDelegate>)delegate;

- (void)fetchFirstPage;
- (void)fetchNextPage;

- (BOOL)reachedLastPage;

- (void)receivedResults:(NSArray *)results total:(NSInteger)total;
- (void)failed;

@end
