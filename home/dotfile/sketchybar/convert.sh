convert_to_argb() {
    local input="$1"
    local alpha="FF"  # 默认不透明
    local red green blue

    # 去掉前缀（# 或 0x）
    input="${input#'#'}"
    input="${input#'0x'}"

    # 根据输入长度处理不同格式
    case ${#input} in
        3)  # #RGB -> Expand to #RRGGBB
            red="${input:0:1}${input:0:1}"
            green="${input:1:1}${input:1:1}"
            blue="${input:2:1}${input:2:1}"
            ;;
        6)  # #RRGGBB -> Use directly
            red="${input:0:2}"
            green="${input:2:2}"
            blue="${input:4:2}"
            ;;
        8)  # #AARRGGBB or 0xAARRGGBB -> Extract
            alpha="${input:0:2}"
            red="${input:2:2}"
            green="${input:4:2}"
            blue="${input:6:2}"
            ;;
        *)
            echo "Invalid color format. Please use #RGB, #RRGGBB, or #AARRGGBB." >&2
            return 1
            ;;
    esac

    # 输出标准 ARGB 格式
    echo "0x${alpha}${red}${green}${blue}"
}