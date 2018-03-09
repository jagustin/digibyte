// Copyright (c) 2011-2014 The LekCoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef DIGIBYTE_QT_DIGIBYTEADDRESSVALIDATOR_H
#define DIGIBYTE_QT_DIGIBYTEADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class LekCoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit LekCoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** LekCoin address widget validator, checks for a valid lekcoin address.
 */
class LekCoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit LekCoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // DIGIBYTE_QT_DIGIBYTEADDRESSVALIDATOR_H
