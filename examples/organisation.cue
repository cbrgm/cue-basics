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

#SomeOtherOrgMembers: #Users & [
    {Name: "Helen", Memberships: ["platform-engineering"]},
    {Name: "Anton", Memberships: ["platform-engineering"]},
    {Name: "John", Memberships: ["platform-engineering"]},
    {Name: "Fritz", Memberships: ["data-analytics"]}
]

#context: {
    members: #Users
    
    teams: #Team
}

context: [Name=_]: #context

#Team: [Name=_]: {

    _memberRef: #Users

    members: [for _,user in _memberRef for _,v in user.Memberships if v == Name {
        name: user.Name
    }]
    
    repositories: [...string]
}

context: "some-org": {

    let orgMembers = #SomeOrgMembers

    teams: "data-analytics": {
	_memberRef: orgMembers
        repositories: [
        "foo",
        "bar"
        ]
    }

    teams: "platform-engineering": {
        _memberRef: orgMembers

	repositories: [
            "something"
        ]
    }
}

context: "other-org": {

    let orgMembers = #SomeOtherOrgMembers    

    teams: "platform-engineering": {
        _memberRef: orgMembers
	
	repositories: [
            "something"
        ]
    }
}
