#include <stdlib.h>
#import <Foundation/Foundation.h>

#define MAXINPUT 10

int main(int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  NSLog(@"%@", @"MATHS!");

  srand((unsigned)time(NULL));
  int right = 0;
  int wrong = 0;

  while (YES) {
    int a = rand()%101;
    int b = rand()%101;

    NSLog(@"%d + %d ?", a, b);

    char buf[MAXINPUT];
    fgets(buf, MAXINPUT, stdin);
    NSString *strInput = [NSString stringWithUTF8String:buf];
    NSString *trimmedString = [strInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([trimmedString isEqualToString:@"q"]) { break; }

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString: trimmedString];

    if (number != nil && [number integerValue] == a + b) {
      right += 1;
      NSLog(@"Right!");
    } else {
      wrong += 1;
      NSLog(@"Wrong!");
    }
  }

  NSLog(@"score: %d right, %d wrong ---- %d\%", right, wrong, (int)(right * 100.0 / (wrong + right)));

  [pool drain];
  return 0;
}
