/*
 Copyright (C) 2026 chloride

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it
 under the terms of the QuantLib license.  You should have received a
 copy of the license along with this program; if not, please email
 <quantlib-dev@lists.sf.net>. The license is also available online at
 <https://www.quantlib.org/license.shtml>.

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

#ifndef quantlib_callable_range_accrual_swap_i
#define quantlib_callable_range_accrual_swap_i

%include swap.i
%include swaption.i
%include gaussian1dmodel.i

%{
using QuantLib::CallableRangeAccrualSwap;
%}

%shared_ptr(CallableRangeAccrualSwap)
class CallableRangeAccrualSwap : public Option {
  public:
    CallableRangeAccrualSwap(
        ext::shared_ptr<RangeAccrualSwap> swap,
        const ext::shared_ptr<Exercise>& exercise,
        Settlement::Type delivery = Settlement::Physical,
        Settlement::Method settlementMethod = Settlement::PhysicalOTC);

    bool isExpired() const;
    Settlement::Type settlementType() const;
    Settlement::Method settlementMethod() const;
    Swap::Type type() const;
    const ext::shared_ptr<RangeAccrualSwap>& underlyingSwap() const;
};

#endif
