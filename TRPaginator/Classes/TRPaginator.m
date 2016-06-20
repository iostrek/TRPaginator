//
//  TRPaginator.m
//  TRPaginator
//
//  Created by iOSTrek on 6/20/16.
//  Copyright © 2016 iOSTrek. All rights reserved.
//

#import "TRPaginator.h"

@interface TRPaginator ()

@property(strong, nonatomic, readwrite) NSMutableArray *results;

@end

@implementation TRPaginator

#pragma mark - Init

- (instancetype)initWithPageSize:(NSInteger)pageSize
                        delegate:(id<TRPaginatorDelegate>)delegate {
  self = [super init];
  if (self) {
    _pageSize = pageSize;
    _delegate = delegate;
    
    [self setDefaultValues];
  }

  return self;
}

- (void)setDefaultValues {
  self.total = 0;
  self.page = 0;
  self.results = [[NSMutableArray alloc] init];
  self.requestStatus = TRRequestStatusNone;
}

- (void)reset {
  [self setDefaultValues];

  if ([self.delegate respondsToSelector:@selector(paginatorDidReset:)]) {
    [self.delegate paginatorDidReset:self];
  }
}

- (BOOL)reachedLastPage {
  if (self.requestStatus == TRRequestStatusNone) {
    return NO;
  }

  // Calculate number of pages.
  NSInteger totalPages =
      ceil((float)self.total / (float)self.pageSize);
  
  return self.page >= totalPages;
}

#pragma - Fetch

- (void)fetchFirstPage {

  [self reset];

  [self fetchNextPage];
}

- (void)fetchNextPage {
  if (self.requestStatus == TRRequestStatusInProgress) {
    return;
  }

  if (![self reachedLastPage]) {
    self.requestStatus = TRRequestStatusInProgress;
    [self fetchResultsWithPage:self.page + 1 pageSize:self.pageSize];
  }
}

#pragma mark - Sublclass methods

// This method should be overwritten in subclass.
- (void)fetchResultsWithPage:(NSInteger)page pageSize:(NSInteger)pageSize {
}

- (void)receivedResults:(NSArray *)results total:(NSInteger)total {
  [self.results addObjectsFromArray:results];
  self.page++;
  self.total = total;
  self.requestStatus = TRRequestStatusFinished;

  [self.delegate paginator:self didReceiveResults:results];
}

- (void)failed {
  self.requestStatus = TRRequestStatusFinished;

  if ([self.delegate respondsToSelector:@selector(paginatorDidFailed:)]) {
    [self.delegate paginatorDidFailed:self];
  }
}

@end
