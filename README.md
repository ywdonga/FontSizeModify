# FontSizeModify
iOS 关于字体根据不同屏幕尺寸等比适配的问题
字数624 阅读10546 评论20 喜欢54
背景
去年的六月份开始了一个新的项目,此项目支持的设备从4S开始一直到6+,也就是说屏幕的尺寸最小的320x480 最大的1242x2208 （不过目前好像大部分的App都会这样去支持），而客户那边有一个奇葩要求 就是所有的控件布局必须依据屏幕的尺寸等比缩放。当然这个对于iOS的开发来说的话还是比较容易实现的（iOS有个Autoresizing刚好是依据父视图的大小作等比缩放的）。

项目就这样愉快的进行，然而当项目快要结束的时候，客户愤怒质问我们为什么字体大小没有根据屏幕作等比适配，再有几天的时间就要上线了，直到现在才发现这种天天在眼前晃荡的问题。。。。

此时我们开发的内心是崩溃的。。。 因为项目非常赶时间，客户要求17天上线第一个版本，所有跟主流程相关的功能必须实现。当时为了赶时间 加上为了做等比适配，所有视图全部是用XIB拖出来的 字体都是直接设置在视图里面 没有抽出来 现在要是做字体的等比适配的话 这种大量完全没有技术含量的体力活让人很无力

解决方法
新建一个UIButton的类别 重写 load 方法 利用OC的运行时 对所有的Button Label作处理（一般有文字的大部分是 Button Label）
代码如下
UIButton+MyFont.h
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

/**
*  按钮
*/
@interface UIButton (myFont)

@end

/**
*  Label
*/
@interface UILabel (myFont)

@end
UIButton+MyFont.m

#import "UIButton+MyFont.h"

//不同设备的屏幕比例(当然倍数可以自己控制)
#define SizeScale ((IPHONE_HEIGHT > 568) ? IPHONE_HEIGHT/568 : 1)

@implementation UIButton (myFont)

+ (void)load{
Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
[self myInitWithCoder:aDecode];
if (self) {
//部分不像改变字体的 把tag值设置成333跳过
if(self.titleLabel.tag != 333){
CGFloat fontSize = self.titleLabel.font.pointSize;
self.titleLabel.font = [UIFont systemFontOfSize:fontSize*SizeScale];
}
}
return self;
}


@end

@implementation UILabel (myFont)

+ (void)load{
Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode{
[self myInitWithCoder:aDecode];
if (self) {
//部分不像改变字体的 把tag值设置成333跳过
if(self.tag != 333){
CGFloat fontSize = self.font.pointSize;
self.font = [UIFont systemFontOfSize:fontSize*SizeScale];
}
}
return self;
}

@end
