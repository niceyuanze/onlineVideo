package com.onlineVideo.web.base;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.onlineVideo.web.util.JSONTranslater;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by niceyuanze on 17-6-4.
 */
public class Result {
    private int code;
    private String msg;
    private Object data;

    public Result() {

    }

    public static Result NEW() {
        return new Result();
    }

    public Result addCode(int code) {
        this.code = code;
        HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
        response.setStatus(code);
        return this;

    }

    public Result addMsg(String msg){
        this.msg = msg;
        return this;
    }


    public Result addData(Object data) {
        this.data = data;
        return this;
    }

    public Result(int code, String msg, Object data) {
        addCode(code);
        addMsg(msg);
        addData(data);



    }



    public static String  success(String content) throws JsonProcessingException {
        return JSONTranslater.tralstate(new Result(200, content, null));
    }

    public static String  success(String content, Object data) throws JsonProcessingException {

        return JSONTranslater.tralstate(new Result(200, content, data));

    }

    public static Result error(int code, String content) {
        return new Result(code, content, null);
    }

    public static Result error(String content) {
        return new Result(404, content, null);
    }

    public static Result success() {
        return new Result(200, "globals.result.success", null);
    }

    public static Result error() {
        return new Result(404, "globals.result.error", null);
    }

    public static String error400(String content) throws JsonProcessingException {
        return  JSONTranslater.tralstate(new Result(400, content, null));
    }

    public static Result error401(String content) {
        return new Result(401, content, null);
    }

    public static Result error402(String content) {
        return new Result(402, content, null);
    }

    public static Result error403(String content) {
        return new Result(403, content, null);
    }

    public static String error404(String content) throws JsonProcessingException {
        return JSONTranslater.tralstate(new Result(404, content, null));
    }

    public static Result error500(String content) {
        return new Result(405, content, null);
    }

    @Override
    public String toString() {
        ObjectMapper objectMapper = new ObjectMapper();
        String result = null;

        try {
            result =  objectMapper.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }finally {
            return result;
        }

    }





    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
