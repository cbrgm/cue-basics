#Conn: {
    address: string
    port: int
    protocol: string
    ...
}

lossy: #Conn & {
    address: "1,2,3"
    port: 9999
    protocol: "upd"
    
}