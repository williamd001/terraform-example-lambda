export const handler = async () => {
    return {
        statusCode: 200,
        body: JSON.stringify(
            {
                orderId: 12,
                item: 'lamp - red'
            }
        )
    }
}