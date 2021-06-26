#User: {
    Name: string
    Memberships: [...string]
}

#Users: [...#User]

#SomeOrgMembers: #Users & [
    {Name: "Adam", Memberships: ["platform-engineering"]},
    {Name: "Eve", Memberships: ["platform-engineering"]},
    {Name: "Pepe", Memberships: ["platform-engineering"]},
    {Name: "Fritz", Memberships: ["data-analytics"]}
]

#context: {
    members: #SomeOrgMembers
    
    teams: #Team
}

context: [Name=_]: #context

#Team: [Name=_]: {
    members: [for _,user in #SomeOrgMembers for _,v in user.Memberships if v == Name {
        name: user.Name
    }]
    
    repositories: [...string]
}

context: "some-org": {
    teams: "data-analytics": {
        repositories: [
        "foo",
        "bar"
        ]
    }
    
    teams: "platform-engineering": {
        repositories: [
            "something"
        ]
    }
}

context: "other-org": {
    
    teams: "platform-engineering": {
        repositories: [
            "something"
        ]
    }
}
