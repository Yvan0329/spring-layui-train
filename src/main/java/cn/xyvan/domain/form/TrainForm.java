package cn.xyvan.domain.form;

import cn.mithrandirw.tf.admin.commons.domain.Idable;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Train表单
 *
 * @author yvan
 * @date 2019-03-27 15:13:24
 */
@Data
public class TrainForm implements Idable {

    private Long id;

    @Length(min = 0, max = 50, message = "名称长度为0~50个字符")
    private String name;

    @Length(min = 0, max = 255, message = "描述长度为0~255个字符")
    private String description;

    @Length(min = 0, max = 50, message = "分类长度为0~50个字符")
    private String sort;

    private Boolean choiced;

    private Boolean deleted;

    private Boolean side;

    private Integer state;

    private Boolean visible;

    private String flag;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date datetime;

    private Integer quantity;

}
