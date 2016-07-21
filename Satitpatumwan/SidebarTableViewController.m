//
//  SidebarTableViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"
#import "LoginViewController.h"

@interface SidebarTableViewController ()

@end

@implementation SidebarTableViewController {
    NSArray *menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuItems = @[@"home", @"my_profile", @"logout"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", indexPath.row); // you can see selected row number in your console;
    
    if ([indexPath row] == 2) {
        NSLog(@"->");
        
        
        
        
//        NSString *query = @"select _name from tbl_user";
//        
//        NSArray *arrData = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        
//        
//        if ([[arrData objectAtIndex:0][0] isEqualToString:myConfig.username_annonymous]  ||  [[arrData objectAtIndex:0][0] isEqualToString:@"(null)"]) {
//
//            NSString *query = @"select _sessid, _session_name, _token from tbl_user LIMIT 1";
        

            
//            NSArray *_user = [[[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]] objectAtIndex:0];
//            
//            NSLog(@"");
//            
//            
//            // NSURL *aUrl = [NSURL URLWithString:@"http://gotuktuk.net/rest/user/logout"];
//            NSURL *aUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@", myConfig.URL, myConfig.endpoint, @"user/logout"]];
//            
//            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
//                                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                               timeoutInterval:30.0];
//            [request setHTTPMethod:@"POST"];
//            // [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//            
//            /*
//             httppost.setHeader("X-CSRF-Token", pTokenLogin);
//             httppost.setHeader("Cookie", pSessionName + "=" + pSessionId);
//             */
//            
//            // Create a mutable copy of the immutable request and add more headers
//            //    NSMutableURLRequest *mutableRequest = [request mutableCopy];
//            [request setValue:[_user objectAtIndex:2] forHTTPHeaderField:@"X-CSRF-Token"];
//            [request setValue:[NSString stringWithFormat:@"%@=%@", [_user objectAtIndex:1], [_user objectAtIndex:0]] forHTTPHeaderField:@"Cookie"];
//            
//            // Now set our request variable with an (immutable) copy of the altered request
//            // request = [mutableRequest copy];
//            
//            
//            // [request setHTTPBody:postData];
//            
//            // NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
//            
//            if(connection)
//            {
//                [connection cancel];
//                connection = nil;
//                self.data = nil;
//            }
//            
//            if (!connection) {
//                
//                connection= [[NSURLConnection alloc] initWithRequest:request delegate:self];
//                
//                self.data = [NSMutableData data];
//            }else{
//            }
//            
//        }else{
//            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Logout" message:@"Confirm Logout." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
        
            alertView.tag = -999;
            [alertView show];
//
//        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (alertView.tag) {
        case -999:
            if (buttonIndex == 0)
            {
                NSLog(@"ยกเลิก");
            }
            else
            {
                NSLog(@"ตกลง");
//                // [self dismissModalViewControllerAnimated:YES];
//                LoginViewController *login = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
//                login.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//                [self.presentingViewController presentModalViewController:login animated:YES];
                
                LoginViewController *mtc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
                [self presentViewController:mtc animated:YES completion:nil];

            }
            
            break;
            
        default:
            break;
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    // Set the photo if it navigates to the PhotoView
//    if ([segue.identifier isEqualToString:@"showPhoto"]) {
//        UINavigationController *navController = segue.destinationViewController;
//        PhotoViewController *photoController = [navController childViewControllers].firstObject;
//        NSString *photoFilename = [NSString stringWithFormat:@"%@_photo", [menuItems objectAtIndex:indexPath.row]];
//        photoController.photoFilename = photoFilename;
//    }
}


@end
