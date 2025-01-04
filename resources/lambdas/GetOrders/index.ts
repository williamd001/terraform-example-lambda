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
                {
                    id: 3,
                    name: 'oak chair'
                },
                {
                    id: 4,
                    name: 'oak desk'
                },
            ]
        )
    }
}