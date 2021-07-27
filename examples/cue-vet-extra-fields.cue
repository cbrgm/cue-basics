#Data: {
	str1: string | *""
	str2: string | *""
	str3: string | *""

	// This ensures that the result of the RHS unifies with true and will cause an error when the RHS is false
	validStringLength: true & (len(str1)+len(str2)+len(str3) < 15)
}

data: #Data & {
    str1: "foo"
    str2: "bar"
    str3: "thiswordisfartooooolong"
}

