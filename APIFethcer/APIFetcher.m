//
//  APIFetcher.m
//  authColl
//
//  Created by Joan Coyne on 10/8/14.
//  Copyright (c) 2014 Mzinga. All rights reserved.
//

#import "APIFetcher.h"


@implementation APIFetcher


+ (NSURL *)URLForQuery:(NSString *)query
{
    query = [NSString stringWithFormat:@"%@&email=jcoyne@mzinga.com&authentication_token=mvsiZ62FvgPP9Myh1DyY", query];
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSURL URLWithString:query];
    
}

+ (NSURL *)URLforClassList

{
    return [self URLForQuery:@"https://test.lifeplot.com/api/v1/courses?"];
}
+ (NSURL *)URLforInformationAboutClass:(id)classId
{
    return [self URLForQuery:[NSString stringWithFormat:@"https://test.lifeplot.com/api/v1/courses/%@", classId]];
}
+ (NSURL *)URLforInformationAboutClassHardcoded
{
    return [self URLForQuery:@"https://test.lifeplot.com/api/v1/courses/1"];
}

@end
