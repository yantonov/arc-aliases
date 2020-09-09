use regex::Regex;

pub fn ticket_number(branch: &str) -> Result<String, String> {
    let re = Regex::new(r"^(.*/|)([A-Z0-9]+-[0-9]+)[^/]*$").unwrap();
    let captures = re.captures(branch);
    match captures {
        None => Err("Cannot extract ticket".to_string()),
        Some(value) => {
            Ok(value.get(2).unwrap().as_str().to_string())
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn simple_scenario_branch_name_is_equal_to_ticket_name() {
        assert_eq!("PROJECTQUEUE-1234",
                   ticket_number("PROJECTQUEUE-1234").unwrap());
    }

    #[test]
    fn omit_branch_suffix_after_ticket_number() {
        assert_eq!("PROJECTQUEUE-1234",
                   ticket_number("PROJECTQUEUE-1234_one_more_pull_request").unwrap());
    }

    #[test]
    fn omit_user_prefix() {
        assert_eq!("PROJECTQUEUE-1234",
                   ticket_number("users/username/PROJECTQUEUE-1234").unwrap());
    }

    #[test]
    fn release_branch() {
        assert!(ticket_number("users/username/project/release/1.2.3.4").is_err());
    }
}