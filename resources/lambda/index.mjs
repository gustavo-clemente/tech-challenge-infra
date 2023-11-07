export const handler = async (event, context, callback) => {
    const response = {

        "headers": {
            "Content-type": "application/json"
        },
        "statusCode": 200,
        "body": JSON.stringify({
            "msg": "Hello World"
        })

    }
    callback(null, response)
};