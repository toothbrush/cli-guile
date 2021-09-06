//
//  main.m
//  cli-guile
//
//  Created by Paul on 6/9/21.
//

#import <Foundation/Foundation.h>

#import <libguile.h>

static void* register_functions (void* data)
{
    SCM test = scm_c_eval_string("(+ 3 5)");
    int foo = scm_to_int(test);
    printf("int foo = %d\n", foo);

    scm_c_eval_string("(begin (display 'HelloWorld) (newline))");
    return NULL;
}

void run_guile(void) {
    printf("hello from C, before Guile\n");
    scm_init_guile();
    scm_with_guile(&register_functions, NULL);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        run_guile();
    }
    return 0;
}
