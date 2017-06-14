//
//  JTCalendarManager.m
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import "JTCalendarManager.h"

#import "JTHorizontalCalendarView.h"

@implementation JTCalendarManager

- (instancetype)init
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    _dateHelper = [JTDateHelper new];
    _settings = [JTCalendarSettings new];
    
    _delegateManager = [JTCalendarDelegateManager new];
    _delegateManager.manager = self;
    
    _scrollManager = [JTCalendarScrollManager new];
    _scrollManager.manager = self;
}

- (void)setContentView:(UIScrollView<JTContent> *)contentView
{
    [_contentView setManager:nil];
    self->_contentView = contentView;
    [_contentView setManager:self];
    
    // Can only synchronise JTHorizontalCalendarView
    if([_contentView isKindOfClass:[JTHorizontalCalendarView class]]){
        _scrollManager.horizontalContentView = _contentView;
    }
    else{
        _scrollManager.horizontalContentView = nil;
    }
}

//override func setContentView(contentView: JTContent) {
//    contentView.manager = nil
//    self.contentView = contentView
//    contentView.manager = self
//    // Can only synchronise JTHorizontalCalendarView
//    if (contentView is JTHorizontalCalendarView) {
//        self.scrollManager.horizontalContentView = contentView
//    }
//    else {
//        self.scrollManager.horizontalContentView = nil
//    }
//}

//func setMenuView(_ menuView: JTMenu) {
//    menuView.manager = nil
//    self.menuView = menuView
//    menuView.manager = self
//    scrollManager.menuView = self.menuView
//}

- (void)setMenuView:(UIScrollView<JTMenu> *)menuView
{
    [_menuView setManager:nil];
    self->_menuView = menuView;
    [_menuView setManager:self];
    
    _scrollManager.menuView = _menuView;
}

//override func date() -> NSDate {
//    return contentView.date!
//}
//
//override func setDate(date: NSDate) {
//    contentView.date = date
//}

- (NSDate *)date
{
    return _contentView.date;
}

- (void)setDate:(NSDate *)date
{
    [_contentView setDate:date];
}

- (void)reload
{
    [_contentView setDate:_contentView.date];
}

@end
