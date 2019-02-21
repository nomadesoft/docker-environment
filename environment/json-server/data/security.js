module.exports = (req, res, next) => {
    // check headers
    if(!req.get('X-Authorization')) {
        return res.status(401).json({message: "Unauthorized, missing header."});
    }

    if(req.get('X-Authorization') != process.env.SECURITY_TOKEN) {
        return res.status(401).json({message: "Unauthorize."})
    }
    next()
}