export const handler = async () => {
    return {
        statusCode: 200,
        body: JSON.stringify(
            [
                {
                    id: 1,
                    name: 'John Doe'
                },
                {
                    id: 2,
                    name: 'Jane Doe'
                },
            ]
        )
    }
}