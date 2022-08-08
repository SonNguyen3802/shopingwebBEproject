
exports.deleteOne = Model => async (req, res, next) => {
    try {
        const doc = await Model.destroy({ where: { id: req.params.id } })
        if (!doc) {
            return res.status(404).json({
                err: 'No data with that Id'
            })
        }
        res.status(200).json({
            status: "success"
        })
    } catch (err) {
        res.status(404).json({
            err
        })
    }
}

exports.updateOne = Model => async (req, res, next) => {
    try {
        const doc = await Model.update(req.body, { where: { id: req.params.id } })
        if (!doc) {
            return res.status(404).json({
                err: 'No data with that Id'
            })
        }
        res.status(200).json({
            data: doc
        })
    } catch {
        res.status(404).json({
            err
        })
    }
}

exports.createOne = Model => async (req, res, next) => {
    try {
        const doc = await Model.create(req.body)
        res.status(200).json({
            data: doc
        })
    } catch {
        res.status(404).json({
            err
        })
    }
}
exports.getOne = Model => async (req, res, next) => {
    try {
        const doc = await Model.findOne({ where: { id: req.params.id } })
        if (!doc) {
            return res.status(404).json({
                err: 'No data with that Id'
            })
        }
        res.status(200).json({
            data: doc
        })
    } catch {
        res.status(404).json({
            err
        })
    }
}

exports.getAll = Model => async (req, res, next) => {
    try {
        const docs = await Model.findAll()
        res.status(200).json({
            data: docs
        })
    } catch {
        res.status(404).json({
            err
        })
    }
}