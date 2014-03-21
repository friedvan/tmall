__author__ = 'fangkuan'

from sklearn import linear_model
from sklearn import ensemble

x_train = []
y_train = []
lgc = linear_model.LogisticRegression()
userbrandScore = {}
userbrandpredict = {}
validate = {}
precision = [0., 0]
recall = [0., 0]
end = -5


def readtraining():
    with open('./positivetraining.dat') as inputfile:
        lines = inputfile.readlines()
        for line in lines:
            line = line.strip()
            items = line.split('\t')
            features = items[3:end]
            features = map(float, features)
            x_train.append(features)
            y_train.append(1)
    with open('./negativetraining.dat') as inputfile:
        lines = inputfile.readlines()
        for line in lines:
            line = line.strip()
            items = line.split('\t')
            features = items[3:end]
            features = map(float, features)
            x_train.append(features)
            y_train.append(0)


def train():
    lgc.fit(x_train, y_train)


def predict():

    with open('./predictset.dat') as inputfile:
        lines = inputfile.readlines()
        for line in lines:
            line = line.strip()
            items = line.split('\t')
            uid = items[0]
            bid = items[1]
            features = items[3:end]
            features = map(float, features)
            proba = lgc.predict_proba(features)[0][1]
            if proba < 0.5:
                continue
            if uid not in userbrandScore:
                userbrandScore[uid] = {bid: proba}
            else:
                userbrandScore[uid][bid] = proba

    for uid in userbrandScore:
        userbrandpredict[uid] = []
        userbrandScore[uid] = sorted(userbrandScore[uid].iteritems(), key=lambda e: e[1], reverse=True)
        for l in userbrandScore[uid]:
            userbrandpredict[uid].append(l[0])


def test():
    with open('./validation.txt') as inputfile:
        lines = inputfile.readlines()
        for line in lines:
            line = line.strip()
            items = line.split(',')
            uid = items[0]
            puritems = items[1:]
            validate[uid] = puritems

    for uid in validate:
        #print uid, '\t', userbrandpredict[uid], '\n', uid, '\t', validate[uid]
        if uid not in userbrandpredict:
            precision[1] += 1
            recall[1] += len(validate[uid])
        else:
            hits = len(set(validate[uid]).intersection(set(userbrandpredict[uid])))
            pr = float(hits) / len(userbrandpredict[uid])
            rl = float(hits) / len(validate[uid])
            precision[0] += hits
            recall[0] += hits
            precision[1] += len(userbrandpredict[uid])
            recall[1] += len(validate[uid])

readtraining()
train()
predict()
test()

print precision, recall
print 'precision\t', precision[0] / precision[1]
print 'recall\t', recall[0] / recall[1]

pr = precision[0] / precision[1]
rl = recall[0] / recall[1]
print 'f-measure\t', 2* pr * rl  / (pr + rl)
