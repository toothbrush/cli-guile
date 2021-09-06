//
//  main.m
//  cli-guile
//
//  Created by Paul on 6/9/21.
//

#import <Foundation/Foundation.h>

#import <libguile.h>

NSString *doshellscript(NSString *cmd_launch_path, NSArray *args) {
//    NSString *doshellscript(NSString *cmd_launch_path, NSString *first_cmd_pt) {
    NSTask *task = [[NSTask alloc] init]; // Make a new task
    [task setLaunchPath: cmd_launch_path]; // Tell which command we are running
    [task setArguments: args];

    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    [task launch];

    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];

    return string;
}




static SCM
next_track_example (SCM trackname)
{
    printf("this is a string:\n");
    printf("  %s\n", scm_to_locale_string(trackname));
    return SCM_UNDEFINED;
}

static void* register_functions (void* data)
{
    scm_c_define_gsubr ("next-track", 1, 0, 0, &next_track_example);
    SCM test = scm_c_eval_string("(+ 3 5)");
    scm_c_eval_string("(define foo 4)");
    scm_c_eval_string("(define bar 9)");
    scm_c_eval_string("(define key \"blabla\")");
    int foo = scm_to_int(test);
    printf("int foo = %d\n", foo);
    scm_c_eval_string("(next-track \"foo\")");
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

    NSString* s = doshellscript(@"/bin/bash", [NSArray arrayWithObjects:@"-c", @"pwd", nil]);
    NSLog(@"%@", s);
    s = doshellscript(@"/bin/bash", [NSArray arrayWithObjects:@"-c", @"ls -l", nil]);
    NSLog(@"%@", s);

    scm_c_primitive_load("./init.scm");

    SCM x = scm_assoc_ref(scm_c_eval_string("queue-panel-map"),
                          scm_from_locale_string("x"));

    scm_display(x, scm_current_output_port());
    scm_newline(scm_current_output_port());

    //scm_call_0(x);


    return 0;
}
