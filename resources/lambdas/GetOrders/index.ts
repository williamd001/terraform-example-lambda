export const handler = async () => {
    return {
        statusCode: 200,
        body: JSON.stringify(
            [
                {
                    id: 1,
                    name: 'red lamp'
                },
                {
                    id: 2,
                    name: 'oak table'
                },
            ]
        )
    }
}