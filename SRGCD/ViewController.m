//
//  ViewController.m
//  SRGCD
//
//  Created by ShawnRufus on 2022/4/22.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, assign) int a;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 例子1
//    NSLog(@"1");
//
//    dispatch_sync(dispatch_get_main_queue(), ^{
//
//        NSLog(@"2");
//
//    });
//
//    NSLog(@"3");
    
    
    // 例子2
//    NSLog(@"1");
//
//    // dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue = dispatch_get_main_queue();
//
//    dispatch_sync(queue, ^{
//
//        NSLog(@"2");
//
//    });
//
//    NSLog(@"3");
    
   
    
    
    // 例子3
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    NSLog(@"1");
//
//    dispatch_sync(queue, ^{
//
//        NSLog(@"2");
//
//        dispatch_sync(queue, ^{
//
//            NSLog(@"3");
//
//        });
//
//        NSLog(@"4");
//
//    });
//
//    NSLog(@"5");
    
    
    // 例子4
//    dispatch_queue_t queue = dispatch_queue_create("test1", DISPATCH_QUEUE_SERIAL);
//
//    NSLog(@"1");
//
//    dispatch_sync(queue, ^{
//
//        NSLog(@"2");
//
//        dispatch_sync(queue, ^{
//
//            NSLog(@"3");
//
//        });
//
//        NSLog(@"4");
//
//    });
//
//    NSLog(@"5");
    
    
    // 例子5
//    NSLog(@"1");
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//
//        NSLog(@"2");
//
//    });

    
    // 例子6
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    dispatch_async(queue, ^{
//
//        NSLog(@"1");
//
//        [self performSelector:@selector(testAction1)];
//        [self performSelector:@selector(testAction2) withObject:nil afterDelay:0];
//
//        NSLog(@"4");
//
//    });
    
//    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
//
//
//    dispatch_async(queue, ^{
//        NSLog(@"队列A读取: %d", self.a);
//    });
//
//    __weak typeof(self) weakSelf = self;
    
//    dispatch_async(queue, ^{
//
//        for (int i = 0; i < 10; i++) {
//            weakSelf.a = weakSelf.a + 1;
//
//            NSLog(@"队列B数据变更: %d", self.a);
//        }
//    });
    
//    dispatch_barrier_async(queue, ^{
//
//        for (int i = 0; i < 10; i++) {
//            weakSelf.a = weakSelf.a + 1;
//
//            NSLog(@"栅栏: %d", self.a);
//        }
//    });
//
//    dispatch_async(queue, ^{
//        NSLog(@"队列C读取: %d", self.a);
//    });
//
    
    //    __weak typeof(self) weakSelf = self;
    //

    
    
//    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_async(queue, ^{
//        //打印1到10
//        for (int i = 1; i < 11; i++) {
//            NSLog(@"0到10: %d",i);
//        }
//    });
//
////    dispatch_async(queue, ^{
////        //打印11到20
////        for (int i = 11; i < 21; i++) {
////            NSLog(@"11到20: %d",i);
////        }
////    });
//
//    dispatch_barrier_async(queue, ^{
//        //打印11到20
//        for (int i = 11; i < 21; i++) {
//            NSLog(@"11到20: %d",i);
//        }
//    });
//
//    dispatch_async(queue, ^{
//        //打印21到30
//        for (int i = 21; i < 31; i++) {
//            NSLog(@"21到30: %d",i);
//        }
//    });
    
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    NSMutableArray *arr = [NSMutableArray array];
    
    dispatch_group_t group = dispatch_group_create();
    
    for (int i = 0; i < 3; i++) {
        
        
        
        dispatch_group_async(group, queue, ^{
           
            NSLog(@"执行: %d 当前数组: %@", i, arr);
            [arr addObject:@(i)];
            
        });

    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"全部执行完: %@", arr);
    });
    

    
}

- (void)testAction1 {
    
    NSLog(@"2");
    
}


- (void)testAction2 {
    
    NSLog(@"3");
    
}

@end
