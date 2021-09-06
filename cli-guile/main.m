//
//  main.m
//  cli-guile
//
//  Created by Paul on 6/9/21.
//

#import <Foundation/Foundation.h>

#import <libguile.h>

void run_guile() {
    printf("hello from C, before Guile\n");
    scm_init_guile();
    //scm_with_guile(&register_functions, NULL);
    //scm_shell(0, NULL);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");

        run_guile();
    }
    return 0;
}
