//
//  UserInfo.swift
//  On The Map
//
//  Created by user on 08/02/2020.
//  Copyright © 2020 Andalus. All rights reserved.
//

import Foundation

struct UserInfo {
    
    let json = """
    {
    "user":{
        "last_name":"Doe",
        "social_accounts":[

        ],
        "mailing_address":null,
        "_cohort_keys":[

        ],
        "_signature":null,
        "_stripe_customer_id":null,
        "guard":{
            "can_edit":true,
            "permissions":[
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-customer",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"staff\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"edit-coach-details",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor-manager\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"send-message",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"registered user\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"edit-coaching-data",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"manage-payments",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-profiles",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"staff\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"ungraduate",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor-manager\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-coach-details",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor-manager\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"edit-experience",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"staff\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-public",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"everyone\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-short",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"everyone\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-customer",
                    "principal_ref":{
                        "ref":"Account",
                        "key":"3903878747"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-profiles",
                    "principal_ref":{
                        "ref":"Account",
                        "key":"3903878747"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"manage-zendesk",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"staff\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"impersonate-read",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"edit",
                    "principal_ref":{
                        "ref":"Account",
                        "key":"3903878747"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"graduate",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"manage-payments",
                    "principal_ref":{
                        "ref":"Account",
                        "key":"3903878747"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"manage-coach",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor-manager\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"view-employer",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"employer\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"edit-coaching-data",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor-manager\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"find",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"staff\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"edit",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"tutor-manager\\3aglobal"
                    }
                },
                {
                    "derivation":[
                        "synthetic"
                    ],
                    "behavior":"register",
                    "principal_ref":{
                        "ref":"ScopedRole",
                        "key":"everyone\\3aglobal"
                    }
                }
            ],
            "allowed_behaviors":[
                "edit",
                "manage-payments",
                "register",
                "send-message",
                "view",
                "view-all-progress",
                "view-customer",
                "view-employer",
                "view-profiles",
                "view-public",
                "view-short"
            ],
            "subject_kind":"Account"
        },
        "_facebook_id":null,
        "timezone":null,
        "site_preferences":null,
        "occupation":null,
        "_image":null,
        "first_name":"John",
        "jabber_id":null,
        "languages":null,
        "_badges":[

        ],
        "location":null,
        "external_service_password":null,
        "_principals":[
            "email verified\\3aglobal",
            "registered user\\3aglobal",
            "everyone\\3aglobal",
            "3903878747"
        ],
        "_enrollments":[

        ],
        "email":{
            "_verification_code_sent":true,
            "_verified":true,
            "address":"john.doe.udacity.user@gmail.com"
        },
        "website_url":null,
        "external_accounts":[

        ],
        "bio":null,
        "coaching_data":null,
        "tags":[

        ],
        "_affiliate_profiles":[

        ],
        "_has_password":true,
        "email_preferences":{
            "ok_user_research":true,
            "master_ok":true,
            "ok_course":true
        },
        "_resume":null,
        "key":"3903878747",
        "nickname":"John",
        "employer_sharing":true,
        "_memberships":[
            {
                "current":true,
                "group_ref":{
                    "ref":"ScopedRole",
                    "key":"everyone\\3aglobal"
                },
                "creation_time":null,
                "expiration_time":null
            }
        ],
        "zendesk_id":null,
        "_registered":true,
        "linkedin_url":null,
        "_google_id":null,
        "_image_url":"//robohash.org/udacity-3903878747.png"
    }
    }
    """.data(using: .utf8)
    let lastName:String
    let firstName:String
    let socialAccounts:[String]
    let mailingAddress:String
    let cohortKeys:[String]
    let singnature:String
    let stripeCustomerID:String
    
    
}

