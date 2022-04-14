function [w_star] = defuzzification(w,mu,defuzzification_type)

defuzzification_type = upper(defuzzification_type);

switch defuzzification_type
    case 'CENTER_OF_GRAVITY'
        w_star = sum(w.*mu)/sum(mu);
    case 'SMALLEST_OF_MAXIMUM'
        [~, max_loc] = max(mu);
        w_star = w(max_loc);
    case 'MIDDLE_OF_MAXIMUM'
        max_val = max(mu);
        max_idx = find(mu == max_val);
        idx = max_idx(round(length(max_idx)/2));
        w_star = w(idx);
    case 'LARGEST_OF_MAXIMUM'
        max_val = max(mu);
        max_idx = find(mu == max_val);
        idx = max_idx(end);
        w_star = w(idx);
    case 'BISECTOR'
        half_of_area = sum(mu)/2;
        sum_area = 0;
        for idx = 1:length(w)
            sum_area = sum_area+mu(idx);
            if sum_area >= half_of_area
                break;
            end
        end
        w_star = w(idx-1);
end