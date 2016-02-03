function [f,df,hessian] = myFun(theta, stim, y)

	r = exp(stim * theta); % estimated rate given the current value of theta

	f = sum(r-y.*(stim*theta)); % the function we want to minimize 

	df = stim'*r - stim'*y; % the derivative of this function with respect to theta
    
    r_stim = bsxfun(@times,r,stim);
    hessian = r_stim'*stim; % the second derivative

return