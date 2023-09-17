export const handler = async () => {
    return {
        statusCode: 200,
        body: JSON.stringify(
            [
                {
                    customerId: 1,
                    name: 'John Doe'
                },
                {
                    customerId: 2,
                    name: 'Jane Doe'
                },
            ]
        )
    }
}